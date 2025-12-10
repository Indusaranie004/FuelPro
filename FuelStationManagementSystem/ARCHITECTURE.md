# Fuel Station Management System - Architecture

## Project Structure

### Backend (`src/main/java/`)

#### API Layer (`com.api/`)
- **AuthAPI.java** - User authentication (login)
- **UserAPI.java** - User management (register, update profile, delete account, change password)
- **ServiceBookingAPI.java** - Service booking operations
- **RefillAPI.java** - Fuel refill requests and management
- **PaymentAPI.java** - Payment processing and management
- **AdminAPI.java** - Admin operations (login, service CRUD)

#### Data Access Layer
- **com.DAO.UserDao.java** - User data access operations
- **AdminPackage.OvmsDAO.java** - Admin and service data access
- **RefillCtrl.RefillDBUtil.java** - Refill data access
- **PaymentPackage.CardController.java** - Payment data access
- **Customer.CustomerController.java** - Service booking data access

#### Models
- **com.model.UserModel.java** - User entity
- **AdminPackage.Service.java** - Service booking entity
- **PaymentPackage.CardModel.java** - Payment card entity
- **Customer.CustomerModel.java** - Customer/booking entity
- **RefillCtrl.Refill.java** - Refill request entity

#### Database Connections
- **com.connection.DBConnect.java** - Main database connection
- **Customer.CustomerDBConnection.java** - Customer service database connection
- **PaymentPackage.DBConnection.java** - Payment database connection

#### Controllers (Legacy)
- **AdminPackage.OVMSController.java** - Admin routing controller (still in use for routing/logout)

### Frontend (`src/main/webapp/`)

#### Pages Structure
```
pages/
├── auth/              # Authentication pages
│   ├── login.jsp
│   ├── register.jsp
│   └── ChangePassword.jsp
├── user/              # User-facing pages
│   ├── Home.jsp
│   ├── HomeLogged.jsp
│   ├── profile.jsp
│   ├── Refill.jsp
│   └── RefillDetails.jsp
├── booking/           # Service booking pages
│   ├── ServiceBooking.jsp
│   └── BookingConfirmation.jsp
├── payment/           # Payment pages
│   ├── addcart.jsp
│   ├── CardDetails.jsp
│   └── update.jsp
└── admin/             # Admin pages
    ├── AdminLogin.jsp
    ├── AdminDashboard.jsp
    ├── AdminInsert.jsp
    ├── AdminUpdate.jsp
    └── AdminUI.jsp
```

#### Assets Structure
```
assets/
├── css/               # Stylesheets
│   ├── form-theme.css
│   ├── Home.css
│   ├── HomeLogged.css
│   ├── Refill.css
│   └── RefillDetails.css
└── images/            # Images
    ├── Home_Background.jpg
    ├── Logo.png
    ├── MaintainanceNewBG.jpg
    ├── PaymentBG.jpg
    ├── Profile.jpg
    └── RefillBG.jpg
```

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login

### User Management
- `POST /api/user/` - Register new user
- `POST /api/user/update` - Update user profile
- `POST /api/user/delete` - Delete user account
- `POST /api/user/changepassword` - Change password

### Service Booking
- `POST /api/service/booking` - Create service booking

### Refill
- `POST /api/refill/` - Create refill request
- `POST /api/refill/delete` - Delete refill request

### Payment
- `POST /api/payment/` - Process payment
- `GET /api/payment/` - Get all payments (admin)
- `POST /api/payment/update` - Update payment (admin)
- `POST /api/payment/delete` - Delete payment (admin)

### Admin
- `POST /api/admin/` - Admin login
- `GET /api/admin/` - Get all services
- `GET /api/admin/service/{id}` - Get service by ID
- `POST /api/admin/service` - Create service
- `POST /api/admin/service/update` - Update service
- `POST /api/admin/service/delete` - Delete service

## Removed/Unused Code

The following servlets have been removed as they are replaced by API endpoints:
- `com.servelet.LoginServlet.java`
- `com.servelet.RegisterServlet.java`
- `com.servelet.UpdateProfileServlet.java`
- `com.servelet.DeleteUserServlet.java`
- `com.servelet.ChangePasswordServlet.java`
- `Customer.CustomerInsertServlet.java`
- `RefillCtrl.RefillServlet.java`
- `PaymentPackage.InsertServlet.java`
- `PaymentPackage.UpdateServlet.java`
- `PaymentPackage.Deleteservlet.java`
- `PaymentPackage.CardGetAll.java`

## Notes

- All frontend pages now use JavaScript `fetch` API to communicate with backend APIs
- Session management is handled server-side in API endpoints
- OVMSController is still used for admin routing and logout functionality
- Frontend is organized by feature/role for better maintainability

