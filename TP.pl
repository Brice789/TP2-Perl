use Text::CSV;
use utf8;

print "---------------------Fonction diferente---------------------\n";

@list_of_numbers = (3..10);
print "@list_of_numbers\n"; 

print "---------------------Fonction diferente---------------------\n";
@list_of_letters = ('c'..'g');
print "@list_of_letters\n"; 

print "---------------------Fonction diferente---------------------\n";
@list_of_upper = ('R'..'V');
print "@list_of_upper\n"; 

print "---------------------Fonction diferente---------------------\n";
$name = "Kylian Mbappe";
$pattern = "mb";
if ($name =~ m/$pattern/) {
  print "Match found\n";
  print "/$pattern/ in $name";
} else {
  print "No match found\n"
}
if ($name =~ m/$pattern/i) {
  print "Match found (case insensitive)\n";
    print "/$pattern/ in $name";
} else {
  print "No match found (case insensitive)\n";
}

print "---------------------Fonction diferente---------------------\n";
$x = "My favorite pet is a cat. I must duplicate it.";
$y = $x;
$y =~ s/cat/dog/;
print "$y\n";
$y = $x;
$y =~ s/cat/dog/g;
print "$y\n";


#print "---------------------Fonction diferente---------------------\n";

# my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });
# open my $fh, "<:encoding(utf8)", "TP06-q1.csv" or die "TP06-q1.csv: $!";

# my %country_wins;
# my %team_wins;

# while (my $row = $csv->getline($fh)) {
#     my ($year, $team, $country) = @$row;
#     $country_wins{$country}++;
#     $team_wins{$team}++;
# }

print "---------------------Fonction diferente---------------------\n";

$number = "Telephone:   01-23-45-67-89";
if ($number =~ m/^Telephone:\s*(\d{2}-\d{2})(-\d{2}-\d{2}-\d{2})/) {
  print "The telephone number extracted is $1\n";
}
$date = "Date:    2014-jun-01";
if ($date =~ m/^Date:\s*([\d]+)-([a-z]+)-([\d]+)$/) {
  print "The year is $1, the month is $2, the day is $3\n";
}

print "---------------------Fonction diferente---------------------\n";


$dir = '/tmp';
opendir(DIR, $dir) or die $!;
while (my $file = readdir(DIR)) {
    # Use a regular expression to ignore files beginning with
    next if ($file =~ m/^\./);
    print "$file\n";
}
closedir(DIR);

print "---------------------Fonction diferente---------------------\n";

# my $dir = '/tmp';
# opendir(DIR, $dir) or die $!;
# while (my $file = readdir(DIR)) {
#     # A file test to check that it is a directory
#     # Use -f to test for a file
#     next unless (-d "$dir/$file");
#     print "$file\n";
# }
# closedir(DIR)



my $dir = '/tmp';
opendir(DIR, $dir) or die $!;
while (my $file = readdir(DIR)) {
    # We only want files
    next unless (-f "$dir/$file");
    # Use a regular expression to find files ending in .txt
    next unless ($file =~ m/\.txt$/);
    print "$file\n";
}
closedir(DIR);