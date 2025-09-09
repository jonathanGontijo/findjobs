String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return "E-mail is required";
  }
  if (!email.contains("@")) {
    return "Invalid E-mail";
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return "Password is required";
  }
  if (!password.contains(" ")) {
    return "Invalid Password";
  }
  if (password.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}
