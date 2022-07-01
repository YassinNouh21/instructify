import "package:instructify/data/model/category.dart";
import "package:instructify/data/model/course.dart";

List<Course> courses = [
  Course.fromMap(const {
    "courseName": "Business Foundations",
    "instructor": "Kaden Rolfson",
    "duration": 1100,
    "price": 1700,
    "imgUrl":
        "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d396qusza40orc.cloudfront.net/phoenixassets/wharton-business-foundations/wharton-business-foundations-logo.jpg?auto=format%2Ccompress&dpr=1&w=330&h=330&fit=fill&q=25",
    "url": [
      {"topic": "Introduction to Marketing", "duration": 900},
      {"topic": "Introduction to Financial Accounting", "duration": 900},
      {"topic": "Managing Social and Human Capital", "duration": 1100},
      {"topic": "Introduction to Corporate Finance", "duration": 1700}
    ]
  })
];
