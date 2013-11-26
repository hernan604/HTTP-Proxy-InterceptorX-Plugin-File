package HTTP::Proxy::InterceptorX::Plugin::File;

use strict;
use 5.008_005;
our $VERSION = '0.01';

use Moose::Role;

sub File {
    my ( $self, $args ) = @_;
    if ( exists $self->urls_to_proxy->{ $self->http_request->{ _uri }->as_string } &&
         exists $self->urls_to_proxy->{ $self->http_request->{ _uri }->as_string }->{ File } ) {
        if ( -e $self->urls_to_proxy->{ $self->http_request->{ _uri }->as_string }->{ File } ) {
          $self->print_file_as_request( $self->urls_to_proxy->{ $self->http_request->{ _uri }->as_string }->{ File } );
          return 1;
        } else {
          warn " FILE NOT FOUND: " . $self->urls_to_proxy->{ $self->http_request->{ _uri }->as_string }->{ File };
        }
        return 0;
    }
}

after 'BUILD'=>sub {
    my ( $self ) = @_;
    $self->append_plugin_method( "File" );
};
1;
__END__

=encoding utf-8

=head1 NAME

HTTP::Proxy::InterceptorX::Plugin::File - overwrite the response content with file content

=head1 SYNOPSIS

    package My::Custom::Proxy;
    use Moose;
    extends qw/HTTP::Proxy::Interceptor/;
    with qw/
        HTTP::Proxy::InterceptorX::Plugin::File
    /;
    1;

    my $p = My::Custom::Proxy->new(
      config_path => 'config_file.pl',
      port        => 9919,
    );

    $p->start;
    1;

=head1 CONFIG

create a config_file.pl

    {
        "http://some.site.com/some/url.htm" => {
            File => "/home/user/files/some_file.htm"
        },
    }

You will be point urls to Files 

Start the proxy

=head1 DESCRIPTION

HTTP::Proxy::InterceptorX::Plugin::File allows you to point urls to local files and have the response content loaded from a local file.

=head1 AUTHOR

Hernan Lopes E<lt>hernan@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013- Hernan Lopes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
