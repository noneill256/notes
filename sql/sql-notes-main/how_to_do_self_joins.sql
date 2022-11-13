SELECT 
    pcat.ProductCategoryID AS ParentCatgry, 
    cat.ParentProductCategoryID AS ParentOfSub,
    -- ^^^ is just to check that the subcategory's parent and the parent column match
    cat.ProductCategoryID AS Subcategory,
    prd.Name AS ProductName
-- parent, subcat, product name

FROM SalesLT.ProductCategory AS pcat 
JOIN SalesLT.ProductCategory AS cat 
    ON pcat.ProductCategoryID = cat.ParentProductCategoryID
JOIN SalesLT.Product AS prd 
    ON cat.ProductCategoryID = prd.ProductCategoryID;
