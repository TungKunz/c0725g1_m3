package repository;

import entity.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    boolean add(Product product);
    boolean delete(String id);
    boolean edit(Product product);
    Product findProduct(String id);
}
