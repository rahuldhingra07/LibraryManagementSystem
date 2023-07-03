-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publication_year INT,
  
);

-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- Create Publishers table
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone_number VARCHAR(20)
);

-- Create Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create Copies table
CREATE TABLE Copies (
    copy_id INT PRIMARY KEY,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Create Borrowers table
CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    borrower_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Loans table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    copy_id INT,
    borrower_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (copy_id) REFERENCES Copies(copy_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);

-- Create Reservations table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    copy_id INT,
    borrower_id INT,
    reservation_date DATE,
    FOREIGN KEY (copy_id) REFERENCES Copies(copy_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);

-- Create Reviews table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    rating INT,
    review_text TEXT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);

-- Create table for managing book-category relationships
CREATE TABLE Book_Category (
    book_id INT,
    category_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
-- Sample data --
INSERT INTO Authors (author_id, author_name)
VALUES (1, 'Author A'),
       (2, 'Author B'),
       (3, 'Author C');

INSERT INTO Publishers (publisher_id, publisher_name, address, phone_number)
VALUES (1, 'Publisher A', '123 Main St', '123-456-7890'),
       (2, 'Publisher B', '456 Elm St', '987-654-3210');

INSERT INTO Categories (category_id, category_name)
VALUES (1, 'Category A'),
       (2, 'Category B'),
       (3, 'Category C');

-- Insert sample data into Books table
INSERT INTO Books (book_id, title, author, publication_year)
VALUES (1, 'Book A', 1, 2010),
       (2, 'Book B', 2, 2015),
       (3, 'Book C', 3, 2020);

-- Insert sample data into Copies table
INSERT INTO Copies (copy_id, book_id)
VALUES (1, 1),
       (2, 1),
       (3, 1);
