package service;

import entity.Product;
import repository.IProductRepository;
import repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private static IProductRepository productRepository=new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean add(Product product) {
        return productRepository.add(product);
    }

    @Override
    public boolean delete(String id) {
        return productRepository.delete(id);
    }

    @Override
    public boolean edit(Product product) {
        return productRepository.edit(product);
    }

    @Override
    public Product findProduct(String id) {
        return productRepository.findProduct(id);
    }
}
