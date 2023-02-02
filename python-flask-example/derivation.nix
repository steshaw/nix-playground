{ lib, python3Packages }:
with python3Packages;
buildPythonApplication {
  pname = "flask-example";
  version = "0.1.0";

  propagatedBuildInputs = [ flask ];

  src = ./.;
}
