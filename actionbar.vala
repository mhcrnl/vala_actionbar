/*
 * The ActionBar container is often placed below the content of the window, and
 * is used to show contextual actions.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        // Prepare Gtk.Window:
        this.title = "ActionBar";
        this.window_position = Gtk.WindowPosition.CENTER;
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);
        
        // MenuBar:
        Gtk.MenuBar bar = new Gtk.MenuBar ();
        this.add (bar);
        
        // File:
        Gtk.MenuItem item_file = new Gtk.MenuItem.with_label ("File");
        bar.add (item_file);
        
        Gtk.Menu filemenu = new Gtk.Menu ();
        item_file.set_submenu (filemenu);
        
        Gtk.MenuItem item_open = new Gtk.MenuItem.with_label ("Open");
        filemenu.add (item_open);
        
        Gtk.MenuItem item_exit = new Gtk.MenuItem.with_label ("Exit");
        item_exit.activate.connect (Gtk.main_quit);
        filemenu.add (item_exit);
        
        var grid = new Grid();
        grid.set_row_spacing(5);
        grid.set_column_spacing(5);
        this.add(grid);

        var label = new Label("");
        label.set_vexpand(true);
        grid.attach(label, 0, 0, 1, 1);

        var actionbar = new ActionBar();
        actionbar.set_hexpand(true);
        grid.attach(actionbar, 0, 1, 1, 1);

        var button1 = new Button.with_label("Cut");
        actionbar.pack_start(button1);
        var button2 = new Button.with_label("Copy");
        actionbar.pack_start(button2);
        var button3 = new Button.with_label("Paste");
        actionbar.pack_end(button3);
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.show_all();

        Gtk.main();

        return 0;
    }
}
