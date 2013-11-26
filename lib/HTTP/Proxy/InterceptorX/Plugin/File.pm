package HTTP::Proxy::InterceptorX::Plugin::File;

use strict;
use 5.008_005;
our $VERSION = '0.01';

use Moose::Role;

=head2

Plugin para abrir o conteudo de um arquivo e sobreescrever o conteúdo de uma url

=cut

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

HTTP::Proxy::InterceptorX::Plugin::File - Blah blah blah

=head1 SYNOPSIS

  use HTTP::Proxy::InterceptorX::Plugin::File;

=head1 DESCRIPTION

HTTP::Proxy::InterceptorX::Plugin::File is

=head1 AUTHOR

Hernan Lopes E<lt>hernan@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013- Hernan Lopes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
