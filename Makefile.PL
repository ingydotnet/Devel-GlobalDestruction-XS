require 5.008001; use strict; use warnings; use utf8;

use lib 'inc';
use ExtUtils::MakeMaker;
use Inline::Module;

my %WriteMakefileArgs = (
  NAME => 'Alt::Devel::GlobalDestruction::XS::Inline',
  AUTHOR => 'Ingy döt Net <ingy@cpan.org>',
  VERSION_FROM => 'lib/Devel/GlobalDestruction/XS.pm',
  ABSTRACT_FROM => 'lib/Devel/GlobalDestruction/XS.pm',
  LICENSE => 'perl',
  MIN_PERL_VERSION => '5.008001',
  test => { TESTS => 't/*.t' },
  postamble => {
    inline => {
      module => 'Devel::GlobalDestruction::XS',
      makestub => 1,
    },
  },
  META_MERGE => {
    'meta-spec' => { version => 2 },
    prereqs => {
      develop => {
        requires => {
          'Inline::Module' => '0.30',
        },
      },
    },
    no_index => {
      directory => [
        'inc',
        'lib/Devel',
      ],
    },
  },
);

WriteMakefile(%WriteMakefileArgs);

