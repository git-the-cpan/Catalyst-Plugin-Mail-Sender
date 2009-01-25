use ExtUtils::MakeMaker;

WriteMakefile(
    NAME      => 'Catalyst::Plugin::Mail::Sender',
    AUTHOR    => 'Thiago Berlitz Rondon (thiago@aware.com.br)',
    PREREQ_PM => {
        Catalyst             => '2.99',
        Mail::Sender         => 0,
    },
    VERSION_FROM => 'Sender.pm'
);
