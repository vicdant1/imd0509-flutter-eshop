abstract class CustomRepository<T> {
  Future<T> create(T model);

  Future<T> delete(String id);

  Future<T> getById(int id);

  Future<List<T>> getAll();
}
