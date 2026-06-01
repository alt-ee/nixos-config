{
  python313Packages,
  fetchFromGitHub,
}:

python313Packages.buildPythonApplication {
  pname = "sclang-lint";
  version = "0.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lucdoebereiner";
    repo = "sclang-lint";
    rev = "dae43d2";
    hash = "sha256-ZD6P0p8wAcEx+YwXr97KFHzzgB41DXw07wpCtOnSeGw=";
  };

  build-system = with python313Packages; [
    setuptools
  ];

  dependencies = with python313Packages; [
    pygls_2
  ];
}
