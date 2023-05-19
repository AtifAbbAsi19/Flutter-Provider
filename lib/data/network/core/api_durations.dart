abstract class ApiDurations {
  Duration getDuration();
}

class TimeDuration implements ApiDurations {

  final duration;

  TimeDuration([this.duration]);




  @override
  Duration getDuration() {
    return Duration(seconds: duration);
  }
}
