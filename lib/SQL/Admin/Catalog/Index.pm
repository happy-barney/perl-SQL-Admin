
package SQL::Admin::Catalog::Index;
use base qw( SQL::Admin::Catalog::Object );

use strict;
use warnings;

our $VERSION = v0.5.0;

######################################################################
######################################################################
sub unique {                             # ;
    my $self = shift;
    $self->{unique} = shift if @_;
    $self->{unique};
}


######################################################################
######################################################################
sub table {                              # ;
    my $self = shift;
    $self->{table} = shift if @_;
    $self->{table};
}


######################################################################
######################################################################
sub column_list {                        # ;
    my $self = shift;
    $self->{column_list} = shift if @_;
    $self->{column_list};
}


######################################################################
######################################################################
sub include_column_list {                # ;
    my $self = shift;
    $self->{include_column_list} = shift if @_;
    $self->{include_column_list};
}


######################################################################
######################################################################
sub where {                              # ;
    my $self = shift;
    $self->{where} = shift if @_;
    $self->{where};
}


######################################################################
######################################################################

package SQL::Admin::Catalog::Index;

1;

