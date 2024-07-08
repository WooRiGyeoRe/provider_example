
/* Provider는 watch, read, select 기능을 제공하고 있음.

  (1) ★ watch -> 상태 값을 읽음(변경을 감시하진 않음!)  
  (2) ★ read -> 상태 값 변경 감시
  (3)   select -> 상태 값의 특정 부분만을 감시

  Provider의 값을 변경하기 위한 함수는 read를 통해 접근하고, 
  상태 값을 사용할 땐 watch를 사용함.

  변경된 상태값을 표시하기 위해 re-build가 발생함! 

  re-build는 많은 비용을 사용하기 때문에
  select로 특정 부분의 변경만 감시해 re-build를 최적화 할 수도 있음.

  (예제)
  Widget build(BuildContext context) {
  final name = context.select((User u) => u.name);
  return Text(name);
}

*/
