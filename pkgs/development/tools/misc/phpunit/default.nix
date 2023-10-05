{ lib, fetchFromGitHub, php }:

php.buildComposerProject (finalAttrs: {
  pname = "phpunit";
  version = "10.3.5";

  src = fetchFromGitHub {
    owner = "sebastianbergmann";
    repo = "phpunit";
    rev = finalAttrs.version;
    hash = "sha256-B59NuZYHJMvW/syH3qbPo1aKx3cWTnUKrjNlcgNGJSs=";
  };

  # TODO: Open a PR against https://github.com/sebastianbergmann/phpunit
  # Missing `composer.lock` from the repository.
  composerLock = ./composer.lock;
  vendorHash = "sha256-5vvTwwIhLLCQDE8JVEZ9e7JD+oJacYt1VQRGxVF5PUk=";

  meta = {
    changelog = "https://github.com/sebastianbergmann/phpunit/blob/${finalAttrs.version}/ChangeLog-${lib.versions.majorMinor finalAttrs.version}.md";
    description = "PHP Unit Testing framework";
    homepage = "https://phpunit.de";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.onny ] ++ lib.teams.php.members;
  };
})
