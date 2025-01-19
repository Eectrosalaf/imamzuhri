class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Discover Courses.",
    image: "images/zuri1.png",
    desc: "Explore courses to deepen your knowledge at your own pace.",
  ),
  OnboardingContents(
    title: "Engage and Learn",
    image: "images/zuri2.png",
    desc:
        "Access assignments, take tests, and track progress effortlessly.",
  ),
  OnboardingContents(
    title: "Stay Organized",
    image: "images/zuri3.png",
    desc:
        "Keep all your courses, assignments, and grades in one place.",
  ),
];
