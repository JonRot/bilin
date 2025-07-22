# Firebase Client Code Documentation
## Bilin Tutoring Platform

This document provides comprehensive documentation for the Firebase client code generated for the Bilin Tutoring Platform.

## 📁 Project Structure

```
bilin/
├── firebase.json                           # Firebase project configuration
├── firestore.rules                        # Firestore security rules
├── firestore.indexes.json                 # Composite indexes for complex queries
├── storage.rules                          # Cloud Storage security rules
├── lib/
│   ├── data_schema.dart                   # Firestore data models
│   ├── sample_data.dart                   # Sample data for database seeding
│   └── services/
│       ├── firestore_repository.dart     # Repository pattern for data access
│       ├── error_handler.dart            # Centralized error handling
│       ├── bilin_service.dart            # High-level business logic service
│       ├── firestore_service.dart        # Original Firestore service (legacy)
│       ├── auth_service.dart             # Authentication service
│       └── data_seeder.dart              # Database seeding utility
```

## 🔐 Security Rules

### Firestore Rules (`firestore.rules`)
- **Role-based access control**: Users can only access data based on their role (parent, teacher, admin)
- **Document ownership**: Users can only modify documents they own
- **Lesson participation**: Only involved parties can access lesson data
- **Teacher verification**: Only approved teachers are visible to parents

### Storage Rules (`storage.rules`)
- **Profile images**: Users can upload/read their own profile images
- **Progress reports**: Teachers can upload attachments, related users can read
- **Document uploads**: User-specific document storage

## 🗃️ Data Schema

### Collections

1. **`users`** - User accounts (parents, teachers, admins)
2. **`students`** - Student profiles linked to parents
3. **`teachers`** - Teacher profiles with qualifications and rates
4. **`locations`** - Lesson locations (homes, public spaces)
5. **`lessons`** - Scheduled and completed lessons
6. **`payments`** - Payment records for lessons
7. **`progressReports`** - Teacher feedback after lessons
8. **`teacherAvailability`** - Teacher schedule availability

### Key Relationships
- Parents → Students (one-to-many)
- Teachers → Lessons (one-to-many)
- Students → Lessons (one-to-many)
- Lessons → Payments (one-to-one)
- Lessons → Progress Reports (one-to-many)

## 🔍 Firestore Indexes

The system includes composite indexes for efficient querying:

### Teacher Queries
- `isApproved + rating` (for finding top-rated approved teachers)
- `languages + serviceLocationRefs + isApproved + rating` (for filtered teacher search)
- `languages + isApproved + hourlyRate` (for price-based filtering)

### Lesson Queries
- `teacherRef + scheduledTime` (teacher's lessons chronologically)
- `studentRef + scheduledTime` (student's lessons chronologically)
- `status + scheduledTime` (lessons by status)
- `teacherRef + status + scheduledTime` (teacher's lessons by status)

### Payment Queries
- `status + paidAt` (pending/completed payments)
- `status + createdAt` (payments by creation date)

## 🚀 Services Architecture

### Repository Pattern
The codebase implements a clean repository pattern with three layers:

#### 1. Base Repository (`BaseRepository<T>`)
- Generic CRUD operations
- Standardized error handling
- Stream support for real-time updates

#### 2. Specialized Repositories
- `UserRepository` - User management
- `StudentRepository` - Student data
- `TeacherRepository` - Teacher profiles and approvals
- `LessonRepository` - Lesson scheduling and management
- `PaymentRepository` - Payment processing
- `LocationRepository` - Location management
- `ProgressReportRepository` - Academic progress tracking
- `TeacherAvailabilityRepository` - Schedule management

#### 3. High-level Service (`BilinService`)
- Business logic layer
- Combines multiple repositories
- Provides user-friendly API
- Comprehensive error handling

### Error Handling System

#### `ErrorHandler` Class
- Firebase-specific error translations
- User-friendly error messages
- Logging and monitoring support
- Network and permission error detection

#### `LoadingStateManager`
- Centralized loading state management
- Success/error/loading states
- Automatic UI state updates

#### `OperationResult<T>`
- Type-safe result wrapper
- Success/failure pattern
- Functional programming approach

## 📝 Usage Examples

### User Management
```dart
// Get user by email
final result = await bilinService.getUserByEmail('user@example.com');
result.when(
  success: (user) => print('User found: ${user?.name}'),
  failure: (message, error) => print('Error: $message'),
);

// Create new user
final newUser = UserModel(
  id: '',
  role: 'parent',
  email: 'parent@example.com',
  name: 'John Doe',
  // ... other fields
);
await bilinService.createUser(newUser);
```

### Teacher Search
```dart
// Find available teachers
final teachers = await bilinService.getAvailableTeachers(
  language: 'English',
  minRate: 50.0,
  maxRate: 150.0,
);
```

### Lesson Scheduling
```dart
// Schedule a lesson with automatic payment creation
await bilinService.scheduleLesson(
  studentRef: studentRef,
  teacherRef: teacherRef,
  locationRef: locationRef,
  scheduledTime: DateTime.now().add(Duration(days: 1)),
  duration: 60,
  language: 'English',
  price: 120.0,
  parentNote: 'Please focus on conversation',
);
```

### Real-time Data Streams
```dart
// Listen to student's lessons
bilinService.streamLessonsByStudent(studentRef).listen((lessons) {
  // Update UI with new lesson data
});

// Monitor pending payments
bilinService.streamPendingPayments().listen((payments) {
  // Update payment status in UI
});
```

## 🛠️ Data Seeding

The `data_seeder.dart` service provides sample data for development and testing:

### Sample Data Includes:
- **7 Users**: 4 parents, 3 teachers, 1 admin
- **7 Students**: Various ages and language preferences
- **5 Teacher Profiles**: Different languages and experience levels
- **4 Locations**: Homes and public spaces in Joinville, SC
- **4 Lessons**: Mix of scheduled and completed
- **3 Payments**: Different statuses and methods
- **2 Progress Reports**: Teacher feedback examples
- **2 Availability Schedules**: Teacher weekly availability

### Seeding Process:
1. Access Admin Dashboard
2. Click "Seed Database" action
3. Confirms before clearing existing data
4. Populates with comprehensive sample data

## 🔄 Real-time Features

### Supported Streams:
- Student lists (for parents)
- Lesson updates (for teachers and parents)
- Payment status changes
- New teacher applications (for admins)

### Implementation:
```dart
StreamBuilder<List<LessonModel>>(
  stream: bilinService.streamLessonsByStudent(studentRef),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return LessonList(lessons: snapshot.data!);
    }
    return CircularProgressIndicator();
  },
)
```

## 🔧 Admin Features

### Dashboard Analytics
- Total parents, teachers, lessons, and payments
- Real-time counts from Firestore

### Teacher Management
- View pending teacher applications
- Approve/reject teacher profiles
- Monitor teacher performance

### System Health
- Error monitoring and logging
- Performance metrics
- User activity tracking

## ⚡ Performance Optimizations

### Efficient Querying
- Composite indexes for complex filters
- Pagination support (limit parameters)
- Optimized document structure

### Caching Strategy
- Repository-level caching
- Stream-based real-time updates
- Minimal document reads

### Error Recovery
- Automatic retry for transient errors
- Graceful degradation for network issues
- User-friendly error messages

## 🚀 Deployment

### Firebase Configuration
```bash
# Deploy Firestore rules and indexes
firebase deploy --only firestore

# Deploy storage rules
firebase deploy --only storage

# Deploy hosting (if configured)
firebase deploy --only hosting
```

### Environment Setup
1. Configure Firebase project in console
2. Run `flutterfire configure` to generate `firebase_options.dart`
3. Deploy security rules and indexes
4. Seed sample data through admin interface

## 📊 Monitoring & Analytics

### Error Tracking
- Centralized error logging
- User action tracking
- Performance monitoring

### Business Metrics
- Lesson completion rates
- Payment success rates
- Teacher approval pipeline
- User engagement metrics

## 🔐 Security Best Practices

### Data Access
- Minimum required permissions
- Role-based access control
- Document-level security rules

### Authentication
- Secure sign-up/sign-in flows
- Token refresh handling
- Session management

### Data Validation
- Client-side input validation
- Server-side security rules
- Type-safe data models

## 🧪 Testing

### Unit Tests
- Repository pattern enables easy mocking
- Isolated business logic testing
- Error handling verification

### Integration Tests
- End-to-end workflow testing
- Firebase emulator support
- Real-time feature testing

## 📚 Additional Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [Firestore Security Rules](https://firebase.google.com/docs/firestore/security/get-started)
- [Flutter Firebase Integration](https://firebase.flutter.dev/)
- [Repository Pattern Guide](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)

---

This Firebase client code provides a robust, scalable foundation for the Bilin Tutoring Platform with comprehensive data management, security, and real-time capabilities.