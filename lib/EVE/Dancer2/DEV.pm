package EVE::Dancer2::DEV;
use Dancer2;
use Dancer2::Plugin::Auth::ESI::SSO;
use Dancer2::Plugin::ESI::API;

our $VERSION = '0.1';
use Data::Dumper;
use Log::Any::Adapter ('Stdout');


get '/' => sub {
    auth_eve;
    my $api = esiApi;
    my $searchAPI = $api->get_api('Search');
    my $id = session('sso_user')->{CharacterID};
    my $result = $searchAPI->get_characters_character_id_search(
        character_id => $id,
        search => 'Mckinley Station',
        categories => ['structure','station'],
        strict => 'false',
    );
    print Dumper $result;
    template 'index' => { 'title' => 'EVE::Dancer2::DEV' };
};

get '/auth/callback' => sub {
    # only here to validate the login
    auth_eve;
};

true;
