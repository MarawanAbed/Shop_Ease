abstract class UseCase<Type, Parameter> {
  Type call([Parameter parameter]);
}

class NoParameter {}


abstract class UseCaseTwoParams<Type, Param1, Param2> {
  Type call([Param1? param1, Param2? param2]);
}