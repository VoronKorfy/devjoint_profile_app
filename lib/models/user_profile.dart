class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String bio;
  final String avatarUrl;
  final int projectsCount;
  final int likesCount;
  final int badgesCount;

  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    required this.avatarUrl,
    required this.projectsCount,
    required this.likesCount,
    required this.badgesCount,
  });
}
