import java.util
import java.util.{Properties, Scanner, UUID}

import org.apache.flink.api.common.serialization.SimpleStringSchema
import org.apache.flink.runtime.client.JobExecutionException
import org.apache.flink.shaded.jackson2.com.fasterxml.jackson.core.JsonParseException
import org.apache.flink.shaded.jackson2.com.fasterxml.jackson.databind.node.ObjectNode
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer010
import org.apache.flink.streaming.util.serialization.JSONKeyValueDeserializationSchema
import com.bingocloud.util.json.{JSONException, JSONObject}


object Main {
  //需要监控的人名
  var user = "汤欣欣"
  val inputTopics: util.ArrayList[String] = new util.ArrayList[String]() {
    {
      add("mn_buy_ticket_1") //车票购买记录主题
      add("mn_hotel_stay_1") //酒店入住信息主题
      add("mn_monitoring_1") //监控系统数据主题
      add("hbc8_buy_ticket_1") //自定义的数据主题
    }
  }
  val bootstrapServers = "bigdata35.depts.bingosoft.net:29035,bigdata36.depts.bingosoft.net:29036,bigdata37.depts.bingosoft.net:29037"


  class Thread_input extends Runnable{
    override def run(): Unit = {
      val input = new Scanner(System.in)
      while(true){
        println("input the name you want to track:")
          val name = input.next()
          user = name

        }
      }
    }

  def main(args: Array[String]): Unit = {
    //the thread that changes the user name which we want to track
    var input_Thread = new Thread(new Thread_input())
    input_Thread.start()

    val env = StreamExecutionEnvironment.getExecutionEnvironment
    env.setParallelism(1)
    val kafkaProperties = new Properties()
    kafkaProperties.put("bootstrap.servers", bootstrapServers)
    kafkaProperties.put("group.id", UUID.randomUUID().toString)
    kafkaProperties.put("auto.offset.reset", "earliest")
    kafkaProperties.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer")
    kafkaProperties.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer")
    val kafkaConsumer = new FlinkKafkaConsumer010[String](inputTopics,
      new SimpleStringSchema, kafkaProperties)
    kafkaConsumer.setCommitOffsetsOnCheckpoints(true)
    val inputKafkaStream = env.addSource(kafkaConsumer)

    //难受，以为随便就搞定的，结果数据是脏的，有空的name，.JsonParseException: Unexpected end-of-input
//    inputKafkaStream.filter(x =>{
//      x.get("value").get("username").asText("").equals(user)
//    }).map(x => {
//      (x.get("metadata").get("topic").asText("") match {
//        case "mn_monitoring_1"
//        => x.get("value").get("found_time")
//        case _ => x.get("value").get("buy_time")
//      }, x)
//    }).print()



    inputKafkaStream.map(x =>{
      try{
        //println(x)
        var x_json = new JSONObject(x)
        val name = x_json.get("username").toString

         if(name!="" && name.equals(user)){
           println(x)
         }
      }catch{
        case ex1:JsonParseException =>{
          //println("wrong record:"+ x)
        }
        case ex2:JSONException =>{
          //println("wrong record:"+ x)
        }
      }
    })


    env.execute()
  }

}
