
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Perinci::Sub::Wrapper" => "0.30",
    "Test::More" => "0.96",
    "Test::Perinci::Sub::Wrapper" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Set arguments for function",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Sub-Property-curry",
  "dist_version" => "0.04",
  "license" => "perl",
  "module_name" => "Perinci::Sub::Property::curry",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Perinci::Sub::PropertyUtil" => 0,
    "perl" => "5.010000"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
