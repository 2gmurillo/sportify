typedef VoidCallback = void Function();

class CounterAction {
  final String label;
  final VoidCallback? onPressed;

  const CounterAction(this.label, this.onPressed);
}
