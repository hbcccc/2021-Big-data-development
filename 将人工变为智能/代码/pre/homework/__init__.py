#%%

import pandas as pd
import matplotlib.pyplot  as plt
import seaborn as sns
import os
import numpy as np

if __name__ == '__main__':
    dataset_path = os.path.join("~/s3data/dataset/kaggleData", 'data.csv')

    # 读取data.csv数据
    df = pd.read_csv(dataset_path)
    df.info()


    #对数据进行处理
    df.drop(['date'],axis=1, inplace = True)

    print(df.country.value_counts())
    #发现国家都是美国，删除这一列信息
    df.drop(['country'], axis = 1, inplace = True)


    fig, ax = plt.subplots(figsize = (10,8))
    cor = df.corr()
    sns.heatmap(cor,annot = True , cmap = "YlGnBu")
    fig.savefig("corr.jpg")


    #分析bedrooms和price的关系
    print(df.bedrooms.value_counts())
    # fig, ax = plt.subplots(figsize = (10,8))
    # sns.barplot(x = df.bedrooms, y = df.price)
    # fig.savefig("bedroomsPrice.jpg")
    #发现bedroom数量为0或9的数据，和price相关性不符合,很突兀，而且数据量分别为2条和1条，过于少，可以删除
    df = df[(df.bedrooms>0) & (df.bedrooms<9)].copy()
    print(df.bedrooms.value_counts())

    #分析 price特征
    print(df.price.agg([min,max]))
    #发现有价格为0的数据，不对劲
    print(len(df[(df.price==0)]))
    #49条价格为0的数据，尝试删掉
    df = df[df.price!=0].copy()
    print(df.price.agg([min, max]))

    df.drop(['street', 'city'], axis=1, inplace=True)

    #对statezip进行onehot编码
    from sklearn import preprocessing
    le = preprocessing.LabelEncoder()
    df['statezip_encoded'] = le.fit_transform(df.statezip)
    df.drop(['statezip'], axis=1, inplace=True)
    df.head()
    from sklearn.preprocessing import OneHotEncoder
    ohc = OneHotEncoder()
    ohc_statezip_data = ohc.fit_transform(df[['statezip_encoded']]).toarray()
    ohc_statezip_index = ['statezip_ohc_'+ str(i) for i in range(0,ohc_statezip_data.shape[1])]
    # print((ohc_statezip_index))
    ohc_df = pd.DataFrame(ohc_statezip_data)
    ohc_df.columns = ohc_statezip_index
    print(ohc_df.head(5))

    # print("onc_df isnull result:")
    # print(ohc_df[ohc_df.isnull().T.any()].head(5))
    print("ohc shape:",ohc_df.shape)
    print(("house data shape: ",df.shape))

    df = df.reset_index()
    df = df.join(ohc_df)
    df.head()
    df.drop(['statezip_encoded'], axis=1, inplace=True)

    print(df.head(5))
    print(df.shape)
    print(df.columns.values)
    print("data shape:", df.shape)
    pd.set_option('display.max_columns', None)
    null_data = df[df.isnull().T.any()]
    print(null_data.head(5))


    #开始划分数据进行训练
    from sklearn.model_selection import train_test_split
    X = df.iloc[:, 1:]
    y = df.price
    X_train, X_rem, y_train, y_rem = train_test_split(X, y, test_size=0.1, random_state=2021)
    X_val, X_test, y_val, y_test = train_test_split(X_rem, y_rem, test_size=0.5, random_state=2021)
    print("train size: ", len(X_train))
    print("val size: ",len(X_val))
    print("test size: ",len(X_test))

    from sklearn.linear_model import LinearRegression

    print(df.isnull().sum())


    #训练模型，使用线性回归
    lin_reg = LinearRegression()
    lin_reg.fit(X_train, y_train)
    from sklearn.metrics import mean_squared_error
    y_pred = lin_reg.predict(X_val)
    mse = mean_squared_error(y_pred, y_val)
    rmse = np.sqrt(mse)
    print("val result: ",rmse)

    y_pred_test = lin_reg.predict(X_test)
    mse = mean_squared_error(y_pred_test,y_test)
    rmse = np.sqrt(mse)
    print("test result: ",rmse)

    pred_testSet = pd.DataFrame({'pred_price':y_pred_test})

    pred_testSet.to_csv("pred_testSet.csv", index=False)








