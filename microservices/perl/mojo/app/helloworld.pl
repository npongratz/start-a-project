use Mojolicious::Lite;

get '/hello/:foo' => sub {
  my $self = shift;
  my $foo  = $self->param('foo');
  $self->render(text => "Hello $foo. Perl's Mojo thinks you are awesome!");
};

app->start;
