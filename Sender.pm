package Catalyst::Plugin::Mail::Sender;

use strict;
use Mail::Sender;
use Carp qw/croak/;

our $VERSION = '0.1';

sub mailsender {
	my $c = shift;
	my $header = $_[1] ? {@_} : $_[0];
	my $args = $c->config->{mailsender} || {};
	my $sender = new Mail::Sender { %$args };
	
	if ($sender->MailMsg ( { %$header } ) < 0) {
		die "$Mail::Sender::Error\n";
	} 
}

=head1 NAME

Catalyst::Plugin::Mail::Sender - Send emails with Catalyst

=head1 SYNOPSIS

    use Catalyst 'Mail::Sender';

=head1 DESCRIPTION

Send emails with Catalyst and L<Mail::Sender>.

=head1 CONFIGURATION

C<config> accepts the same options as L<Mail::Sender>.

	__PACKAGE__->config->{mailsender} = {
        	from => "Thiago Rondon <tbr\@examplennn.com.br>",
		smtp => "mail.examplennn.com.br",
		auth => 'LOGIN',
		authid => "tbr\@examplennn.com.br",
		authpwd => "password",
		headers => "MIME-Version: 1.0\r\nContent-type: text/html\r\nContent-Transfer-Encoding: 7bit",
		debug => "/var/tmp/mail.sender.debug"
	};

=head1 METHODS

C<mailsender()> is MailMsg() shortcut of L<Mail::Sender> to a simple message.

	$c->mailsender({
                to => "to@examplennn.com.br",
		subject => "Plugin Mail::Sender",
		msg => "Hello",
	});

=head1 SEE ALSO

L<Catalyst>, L<Mail::Sender>,

=head1 AUTHOR

Thiago Berlitz Rondon, C<thiago@aware.com.br>

=head1 COPYRIGHT

This program is free software, you can redistribute it and/or modify it 
under the same terms as Perl itself.

=cut

1;
