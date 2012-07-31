
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::More" => "0.96"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Set arguments for function",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Sub-property-curry",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "Perinci::Sub::property::curry",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Perinci" => 0,
    "Perinci::Sub::Wrapper" => "0.08",
    "perl" => "5.010000"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
