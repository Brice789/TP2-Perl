# #use strict;
# #use warnings;
# use Text::CSV;
# use utf8;
# binmode(STDOUT, ":encoding(UTF-8)");
# binmode(STDERR, ":encoding(UTF-8)");


# my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });
# open my $fh, "<:encoding(utf8)", "TP06-q1.csv" or die "TP06-q1.csv: $!";

# my %country_wins;
# my %team_wins;

# while (my $row = $csv->getline($fh)) {
#     my ($year, $team, $country) = @$row;
#     $country_wins{$country}++;
#     $team_wins{$team}++;
# }

# close $fh;

# open my $out, ">", "uefa_cl_report.txt" or die "uefa_cl_report.txt: $!";
# foreach my $country (keys %country_wins) {
#     print $out "$country: $country_wins{$country}\n";
# }

# # foreach my $team (keys %team_wins) {
# #    # print $out "$team: $team_wins{$team}\n";
# # }

# close $out;


use strict;
use warnings;
use Text::CSV;


my $filename = '/Users/bricelewis/Documents/Code/Linux-Script/Perl/TP2/TP06-q1.csv';

# Initialize Text::CSV
# J'ai mis binary à 1 pour que le script fonctionne sur Windows
# J'ai mis auto_diag à 1 pour que le script affiche les erreurs

# J'ai installer les library CSV et Text::CSV sur perl
my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });

# Open the CSV file
open my $fh, "<:encoding(utf8)", $filename or die "Je ne peux pas ouvrir ce fichier '$filename': $!";

my %country_wins;
my %team_wins;

# Read each line of the CSV
while (my $row = $csv->getline($fh)) {
    my ($year, $team, $country) = @$row;

   #Mettre les pays et les équipes dans un hash pour incrementer 
    $country_wins{$country}++;
    $team_wins{$team}++;
}

close $fh;

open my $out, ">:encoding(utf8)", "uefa_cl_report.txt" or die "Je ne peux pas ouvrir le fichier en sortie: $!";


print $out "Compte des gagants par pays ou Count of winners by country\n";
foreach my $country (sort keys %country_wins) {
    print $out "- $country, $country_wins{$country} winner(s)\n";
}


print $out "\nList of winning teams\n";
foreach my $team (sort keys %team_wins) {
    print $out "- $team, $team_wins{$team} win(s)\n";
}

close $out;
