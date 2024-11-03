let
  userName = "anc13nt";
  email = "ssamozhen13@gmail.com";
in
{
    programs.git = {
        enable = true;
        userName = userName;
        userEmail = email;
    };
}
