use GTK::Simple;

my GTK::Simple::App $app .= new(title => "Hello GTK!");

$app.set_content(
    GTK::Simple::VBox.new(
        (my $button = GTK::Simple::Button.new(label => "Hello World!")),
        (my $second = GTK::Simple::Button.new(label => "Goodbye!"))
    )
);

say $button.perl;
say $second.perl;

$second.sensitive = 0;

$button.clicked.tap({ .WHICH.say });
$button.clicked.tap({ .sensitive = 0; $second.sensitive = 1 });

$second.clicked.tap({ $app.destroy; start { sleep 1; exit } });
$second.clicked.tap({ .WHICH.say });

say "these are the supplies:";
say $button.clicked.WHICH;
say $second.clicked.WHICH;

$app.run;