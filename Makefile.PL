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
  META_MERGE => {
    'meta-spec' => { version => 2 },
    prereqs => {
        develop => {
          requires => {
            'Inline::Module' => '0.27',
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
  postamble => {
    inline => {
      module => 'Devel::GlobalDestruction::XS',
    },
  },
);

WriteMakefile(%WriteMakefileArgs);

