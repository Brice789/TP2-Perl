#use strict; #work with strict pragma :)
#use warnings; #work with warnings pragma :)
use File::Copy;

#die raise an exception

my $dir = 'books-tp06'; 

# Check if directory is provided
#die "Usage: $0 <directory>\n" unless $dir;

# Open the directory
opendir(DIR, $dir) or die "Could not open directory: $!";

while (my $file = readdir(DIR)) {
    next if ($file =~ m/^\./);  # Skip hidden files and directories

    # Open the file for reading
    open my $fh, '<', "$dir/$file" or die "Cannot open file: $!";
    # Check if directory is provided

    # Read the file content
    my $content = do { local $/; <$fh> };

    my $extension;
    my $title;


    #I search for the content and I put it in a variable
    #for HTML, if it's contain <html> or a <head> or a <body> it's HTML 
    if ($content =~ /<!DOCTYPE html>|<html>|<head>|<body>/i) {
        $extension = 'html';
        #so i replace the content
        ($title) = $content =~ /<title>(.*?)<\/title>/s;
    } else {
        $extension = 'txt';
        ($title) = $content =~ /^(.*)$/m;
    }

    close $fh;

    # Process title for filename
    $title =~ s/[^\w\s-]//g; # Remove special characters
    $title =~ s/\s+/_/g;     # Replace spaces with underscores

    # Rename the file
    move("$dir/$file", "$dir/$title.$extension") or die "The process of Rename file isn't working: $!";

}

closedir(DIR);





























# use File::Copy;

# # Directory containing the files
# my $dir = 'books-tp06';

# opendir(DIR, $dir) or die $!;
# while (my $file = readdir(DIR)) {

#     next if ($file =~ m/^\./);  # Skip hidden files and directories

#     open my $fh, '<', "$dir/$file" or die $!;
#     local $/ = undef;
#     my $content = <$fh>;
#     close $fh;

#     my $extension = $content =~ /<html>/i ? 'html' : 'txt';
#     my ($title) = $content =~ /<title>(.*?)<\/title>/i if $extension eq 'html';
#     ($title) = $content =~ /^(.*)$/m if $extension eq 'txt';

#     $title =~ s/[^\w\s-]//g;
#     $title =~ s/\s+/_/g;

#     move("$dir/$file", "$dir/$title.$extension") or die "Could not rename file: $!";
# }
# closedir(DIR);



# use File::Copy;

# # Directory containing the files
# my $dir = 'books-tp06'; # First argument from command line

# # Check if directory is provided
# die "Usage: $0 <directory>\n" unless $dir;

# opendir(DIR, $dir) or die "Could not open directory: $!";

# while (my $file = readdir(DIR)) {
#     next if ($file =~ m/^\./);  # Skip hidden files and directories

#     # Open the file for reading
#     open my $fh, '<', "$dir/$file" or die "Cannot open file: $!";

#     # Read the file content
#     my $content = do { local $/; <$fh> };

#     my $extension;
#     my $title;

#     # Determine if the file is HTML or TXT based on its content
#     if ($content =~ /<html>/i) {
#         $extension = 'html';
#         ($title) = $content =~ /<title>(.*?)<\/title>/s;
#     } else {
#         $extension = 'txt';
#         ($title) = $content =~ /^(.*)$/m;
#     }

#     close $fh;

#     # Process title for filename
#     $title =~ s/[^\w\s-]//g; # Remove special characters
#     $title =~ s/\s+/_/g;     # Replace spaces with underscores

#     # Rename the file
#     move("$dir/$file", "$dir/$title.$extension") or die "Could not rename file: $!";
# }

# closedir(DIR);



