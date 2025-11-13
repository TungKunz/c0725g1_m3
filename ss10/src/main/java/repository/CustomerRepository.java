package repository;

import entity.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Tùng","02/03/2001","Huế","https://thuthuatnhanh.com/wp-content/uploads/2021/06/hinh-anh-hinh-nen-logo-MU-cung-doi-tuyen.jpg"));
        customerList.add(new Customer("Khánh","12/13/2004","Quảng Nam","2.jpg"));
        customerList.add(new Customer("Hoàng","01/01/2001","Đà Nẵng","3.jpg"));
        customerList.add(new Customer("A Nguyên","22/03/1997","Quảng Trị","4.jpg"));
        customerList.add(new Customer("Mân Đàn","11/11/2001","Quảng Bình","5.jpg"));

    }
    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        return customerList.add(customer);
    }
}
