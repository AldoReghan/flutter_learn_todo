class Todo{
  int id;
  String description;
  bool isDone = false;

  Todo({
    this.id,
    this.description,
    this.isDone = false
  });

  //convert database json to object
  factory Todo.fromDataseJson(Map<String, dynamic> data) => Todo(
    id: data['id'],
    description: data['description'],
    isDone: data['is_done'] == 0 ? false : true
  );

  //covert todo object to convert and store to database
  Map<String, dynamic> toDoDatabaseJson() => {
    "id" : this.id,
    "description" : this.description,
    "is_done" : this.isDone == false ? 0 : 1,
  };

}