import 'package:portfolio_website1/models/projects_model.dart';

class ProjectController {
  List<ProjectModel> projectsList = [
    ProjectModel(
        projectName: "Diary App",
        projectDescription: """
- Made front-end with Flutter.
- Used ’http’ dart module to make GET, POST, PATCH and DELETE requests.
- Made the back-end server with NodeJS and ExpressJS
- Used Mongoose library to connect and perform operations with MongoDB .
- Stored data with hashing and validation, as per the requirement.
        """,
        imageLink: "images/diary_app_logo.png",
        projectLink: "www.github.com/AwsmAsim/diary_app_flutter_nodejs"
    ),
    ProjectModel(
        projectName: "PDF Maker",
        projectDescription: """
- Front-end with Flutter. Get images from the user and sends to backend.
- Backend with flask accepts the images and converts them into a pdf file and sends back to front-end.
- The backend is hosted on heroku.
        """,
        imageLink: "images/pdf_maker_logo.png",
        projectLink: "github.com/AwsmAsim/pdf-maker-flutter-flask-miniproject"
    ),
    ProjectModel(
        projectName: "Payminder",
        projectDescription: """
- Payment reminder application which provides reminders for one-time, weekly, monthly and yearly payments.         
- User Authentication with Firebase.
- Storage in FireCloud.
        """,
        imageLink: "images/payminder_logo.png",
        projectLink: "github.com/AwsmAsim/Payminder"
    ),
    ProjectModel(
      projectName: "Namazzi",
      projectDescription: """
- This was my first application that I published on Play Store after my fresher year.
- It retrieves location and gives prayer timings for the accordingly using the alashan API.
      """,
      imageLink: 'images/namazzi_logo.png',
      projectLink: "play.google.com/store/apps/details",
      queryParameters: {"id": "com.asimJunaid.namazzi", "hl": "en_IE", "gl": "US"}
    ),
  ];




}
