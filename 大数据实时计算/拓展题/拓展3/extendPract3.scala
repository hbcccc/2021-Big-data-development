import java.util.Properties

import org.apache.kafka.clients.producer.{KafkaProducer, ProducerRecord}


object extendPract3 {
  val topic = "hbcExtend3_version1"
  val bootstrapServers = "bigdata35.depts.bingosoft.net:29035,bigdata36.depts.bingosoft.net:29036,bigdata37.depts.bingosoft.net:29037"

  def main(args: Array[String]): Unit = {
    val s3Content = readFromSql()
    produceToKafka(s3Content)
  }

  /**
   * read data from hive
   *
   */
  def readFromSql(): String = {
    import java.sql.DriverManager
    val url = "jdbc:hive2://bigdata112.depts.bingosoft.net:22112/user04_db"
    val properties = new Properties()
    properties.setProperty("driverClassName", "com.mysql.cj.jdbc.Driver")
    properties.setProperty("user", "user04")
    properties.setProperty("password", "pass@bingo4")
    val connection = DriverManager.getConnection(url, properties)
    val statement = connection.createStatement()
    val sql = "show tables"
    val resultSet = statement.executeQuery(sql)
    val content = new StringBuilder()

    while (resultSet.next) {
      val tableName = resultSet.getString(1)
      //output all the tables' name
      println("tableName：" + tableName)
      content.append(tableName + "\n")
    }
    content.toString()
  }

  /**
   * wtite the sqlContent to the Kafka
   *
   */
  def produceToKafka(sqlContent: String): Unit = {
    val props = new Properties
    props.put("bootstrap.servers", bootstrapServers)
    props.put("acks", "all")
    props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer")
    props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer")
    val producer = new KafkaProducer[String, String](props)
    val dataArr = sqlContent.split("\n")
    for (s <- dataArr) {
      if (!s.trim.isEmpty) {
        val record = new ProducerRecord[String, String](topic, null, s)
        println("producing data: " + s)
        producer.send(record)
      }
    }
    producer.flush()
    producer.close()
  }
}