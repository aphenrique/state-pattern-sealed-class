abstract class BaseState {
  void track<T>(Function track) {
    if (this is T) {
      track();
    }
  }
}
