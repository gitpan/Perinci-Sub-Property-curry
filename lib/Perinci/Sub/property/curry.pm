package Perinci::Sub::property::curry;

use 5.010;
use strict;
use warnings;
#use Log::Any '$log';

use Perinci::Util qw(declare_property);

our $VERSION = '0.01'; # VERSION

declare_property(
    name => 'curry',
    type => 'function',
    schema => ['hash*'],
    wrapper => {
        meta => {
            prio    => 10,
            convert => 1,
        },
        handler => sub {
            my ($self, %args) = @_;
            my $v    = $args{new} // $args{value} // {};
            my $meta = $args{meta};

            $self->select_section('before_call_arg_validation');
            for my $an (keys %$v) {
                my $av = $v->{$an};
                $self->_errif(400, "\"Argument $an has been set by curry\"",
                              'exists($args{\''.$an.'\'})');
                $self->push_lines(
                    '$args{\''.$an.'\'} = '.
                        Perinci::Sub::Wrapper::__squote($av).';');
            }
        },
    },
);

1;
# ABSTRACT: Set arguments for function


__END__
=pod

=head1 NAME

Perinci::Sub::property::curry - Set arguments for function

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 # in function metadata
 args  => {a=>{}, b=>{}, c=>{}},
 curry => {a=>10},

 # when calling function
 f();             # equivalent to f(a=>10)
 f(b=>20, c=>30); # equivalent to f(a=>10, b=>20, c=>30)
 f(a=>5, b=>20);  # error, a has been set by curry

=head1 DESCRIPTION

This property sets arguments for function.

=head1 SEE ALSO

L<Perinci>

=head1 FUNCTIONS

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

