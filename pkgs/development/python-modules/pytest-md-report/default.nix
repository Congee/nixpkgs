{ lib
, buildPythonPackage
, fetchPypi
, pytablewriter
, pytest
, tcolorpy
, typepy
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pytest-md-report";
  version = "0.3.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-muQ8lb00tdhAvaLaNupuHh6YqbDEvkaGFbnb4tR2Wes=";
  };

  propagatedBuildInputs = [
    pytablewriter
    tcolorpy
    typepy
  ];

  buildInputs = [ pytest ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pytest_md_report" ];

  meta = with lib; {
    description = "A pytest plugin to make a test results report with Markdown table format";
    homepage = "https://github.com/thombashi/pytest-md-report";
    changelog = "https://github.com/thombashi/pytest-md-report/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ rrbutani ];
  };
}
