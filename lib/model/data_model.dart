class User {
  final String name;
  final String title;
  final String location;
  final int age;
  final Contact contact;
  final List<String> about;
  final List<String> skills;
  final List<Experience> experience;
  final List<Project> projects;
  final Education education;

  User({
    required this.name,
    required this.title,
    required this.location,
    required this.age,
    required this.contact,
    required this.about,
    required this.skills,
    required this.experience,
    required this.projects,
    required this.education,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      title: json['title'],
      location: json['location'],
      age: json['age'],
      contact: Contact.fromJson(json['contact']),
      about: List<String>.from(json['about']),
      skills: List<String>.from(json['skills']),
      experience: (json['experience'] as List)
          .map((e) => Experience.fromJson(e))
          .toList(),
      projects:
          (json['projects'] as List).map((p) => Project.fromJson(p)).toList(),
      education: Education.fromJson(json['education']),
    );
  }
}

class Contact {
  final String email;
  final String github;
  final String linkedin;
  final String twitter;
  final String insta;

  Contact({
    required this.email,
    required this.github,
    required this.linkedin,
    required this.twitter,
    required this.insta,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      github: json['github'],
      linkedin: json['linkedin'],
      twitter: json['twitter'],
      insta: json['insta'],
    );
  }
}

class Experience {
  final String title;
  final String company;
  final String duration;
  final List<String> responsibilities;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.responsibilities,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      company: json['company'],
      duration: json['duration'],
      responsibilities: List<String>.from(json['responsibilities']),
    );
  }
}

class Project {
  final String name;
  final String description;
  final List<String> technologies;
  final String github;
  final String demo;

  Project({
    required this.name,
    required this.description,
    required this.technologies,
    required this.github,
    required this.demo,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      github: json['github'],
      demo: json['demo'],
    );
  }
}

class Education {
  final String degree;
  final String institution;
  final String year;

  Education({
    required this.degree,
    required this.institution,
    required this.year,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'],
      institution: json['institution'],
      year: json['year'],
    );
  }
}
