package repository;

import entity.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean add(Customer customer);
}
