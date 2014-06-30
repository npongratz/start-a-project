use Mojolicious::Lite;

get '/hello/:foo' => sub {
  my $self = shift;
  my $foo  = $self->param('foo');
  $self->render(text => "Hello from $foo?");
};

app->start;
