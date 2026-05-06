DROP DATABASE IF EXISTS session03;
CREATE DATABASE session03;
USE session03;

/*
Phân tích giải pháp
Giải pháp 1: Sử dụng lệnh DELETE để xóa vĩnh viễn các dòng dữ liệu
Dữ liệu bị gỡ bỏ hoàn toàn khỏi bảng và các tệp tin lưu trữ của Database

Giải pháp 2: Sử dụng lệnh UPDATE để thay đổi trạng thái của một cột đánh dấu
Bản ghi vẫn tồn tại, ta chỉ thay đổi giá trị của cột IsDeleted từ 0 thành 1

So sánh 
Giải pháp 1:
- Có giải phóng dung lượng
- Tốc độ truy vấn nhanh
- Khi mất dữ liệu rất khó để khôi phục

Giải pháp 2:
- Không bị mất dữ liệu
- Chậm hơn và phải quét các bản ghi đã xóa
- Chỉ bị mất dữ liệu tạm thời vẫn có thể khôi phục lại được

--> Dùng giải pháp 2 vì nếu như hủy đơn hàng mà lúc khách hàng cần xác nhận lại đơn thì có thể khôi phục lại được lịch sử để xác nhận
*/

CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    OrderDate DATETIME,
    TotalAmount DECIMAL(18, 2),
    Status VARCHAR(20),
    IsDeleted TINYINT(1) DEFAULT 0 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ORDERS (CustomerName, OrderDate, TotalAmount, Status) VALUES
('Nguyễn Văn A', '2023-01-10', 500000, 'Completed'),
('Khách hàng vãng lai', '2023-02-15', 1200000, 'Canceled'),
('Trần Thị B', '2023-05-20', 300000, 'Canceled'),
('Lê Văn C', '2024-01-05', 850000, 'Completed');

UPDATE ORDERS 
SET IsDeleted = 1 
WHERE Status = 'Canceled';

SELECT OrderID, CustomerName, OrderDate, TotalAmount, Status
FROM ORDERS 
WHERE IsDeleted = 0 
AND Status = 'Completed';

SELECT OrderID, CustomerName, TotalAmount, Status
FROM ORDERS 
WHERE IsDeleted = 1;