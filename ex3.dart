class CustomDuration {
  int _mSeconds;

  CustomDuration(this._mSeconds) {
    if (_mSeconds < 0) throw Exception('Duration cannot be negative!');
  }

  CustomDuration.fromHours(int hours): this._mSeconds = hours*60*60*1000;
  CustomDuration.fromMinutes(int minutes) : this._mSeconds = minutes * 60 * 1000;
  CustomDuration.fromSeconds(int seconds) : this._mSeconds = seconds * 1000;

  int get inMSeconds => this._mSeconds;

  bool operator >(CustomDuration other) {
    return _mSeconds > other._mSeconds;
  }

  bool operator <(CustomDuration other) {
    return _mSeconds < other._mSeconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(_mSeconds + other._mSeconds);
  }

  // Subtract two durations
  CustomDuration operator -(CustomDuration other) {
    int result = _mSeconds - other._mSeconds;
    if (result < 0) result = 0; // Prevent negative duration
    return CustomDuration(result);
  }

}

void main() {
  var d1 = CustomDuration.fromHours(2);
  var d2 = CustomDuration.fromMinutes(30);
  var d3 = CustomDuration.fromSeconds(90);

  print(d1); 
  print(d2); 
  print(d3); 

  print(d1 > d2); 
  print(d2 + d3); 
  print(d2 - d3); 
}
