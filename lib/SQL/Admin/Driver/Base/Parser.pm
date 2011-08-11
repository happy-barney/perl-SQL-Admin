
package SQL::Admin::Driver::Base::Parser;

use strict;
use warnings;

our $VERSION = v0.5.0;

######################################################################

use Parse::RecDescent;

our $AUTOLOAD;

my $parser_skip = '([ \t\r\n]*)|((--(.*)\n))*';

######################################################################
######################################################################
sub new {                                # ;
    my ($class, %param) = @_;
    my $grammar = $class->grammar || return;

    $::RD_HINT = 1;
    $Parse::RecDescent::skip = '([ \t\r\n]*)|((--(.*)\n))*';

    bless {
        %param,
        parser => Parse::RecDescent->new ($grammar),
    }, ref $class || $class;
}


######################################################################
######################################################################
sub configure {                          # ;
    my ($self, $key, $value) = @_;

    $self->{$key} = $value if @_ == 3;
    $self->{$key};
}


######################################################################
######################################################################
sub load {                               # ;
    my ($self) = @_;

    my $data = do {
        local $/;

        join ('', $self->{file} ? (map {
            open my $fh, '<', $_ or die "Unable open ${_}: $!\n";
            <$fh>
        } @{ $self->{file} } ) : <>);
    };

    $self->parse ($data);
}


######################################################################
######################################################################
sub parser {                             # ;
    shift->{parser};
}


######################################################################
######################################################################
sub parse {                              # ;
    my ($self, $data) = @_;

    $self->postprocess ($self->parser->parse_sql ($data));
}


######################################################################
######################################################################
sub postprocess {                        # ;
    shift; @_;
}


######################################################################
######################################################################
sub DESTROY {                            # ;
}


######################################################################
######################################################################
sub AUTOLOAD {                           # ;
    my ($self, @args) = @_;
    my $name = substr $AUTOLOAD, 2 + rindex $AUTOLOAD, '::';

    $self->parser->$name (@args);
}


######################################################################
######################################################################

package SQL::Admin::Driver::Base::Parser;

1;