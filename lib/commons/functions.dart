String getGreetingTime() {
  int now = DateTime.now().hour;
  if (now >= 17 || now < 5) {
    return "evening";
  } else if (now < 12) {
    return "morning";
  } else {
    return "afternoon";
  }
}
