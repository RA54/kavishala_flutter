String getTimewiseassets()
{
  int time=DateTime.now().hour.toInt();
  print(time.toString());
  if(time>=5&&time<12){
    return "assets/images/sunrise.png";
  }
  else if(time>=12&& time<17){
    return "assets/images/afternoon.png";
  }
  else if(time>12&& time<17){
    return "assets/images/afternoon.png";
  }
  else{
    return "assets/images/night.png";
  }
}