class Tag {

  final String id;
  final String label;

  Tag(this.id, this.label);

  @override
  String toString() => '$label#$id';
}