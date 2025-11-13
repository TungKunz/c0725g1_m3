package repository;

import entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product("1","Tùng",999,"Huế"));
        productList.add(new Product("2","Tê Liệt",6,"6 Cúp"));
        productList.add(new Product("3","Mân Đàn",123,"Âu Tra Phót"));
        productList.add(new Product("4","Hoàng",888,"Đà Nẵng"));
        productList.add(new Product("5","RedBull",567,"Thái Lan"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public boolean add(Product product) {
        return productList.add(product);
    }

    @Override
    public boolean delete(String id) {
        List<Product> products = findAll();
        boolean remove = products.removeIf(p->p.getId().equals(id));
        return remove;
    }

    @Override
    public boolean edit(Product product) {
        List<Product> products = findAll();
        boolean check= false;
        for (int i = 0 ; i<products.size();i++){
            if(products.get(i).getId().equals(product.getId())){
                products.set(i,product);
                check= true;
                break;
            }
        }
        return check;
    }

    @Override
    public Product findProduct(String id) {
        List<Product> products = findAll();
        for(Product p : products){
            if(p.getId().equals(id)){
                return p;
            }
        }
        return null;
    }
}
