package com.wahid.workflowplatform.product;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping
    public List<Product> getProducts() {
        return productService.findAll();
    }
    @PostMapping
    public Product create(@RequestBody Product product) {
        return productService.create(product);
    }
}
