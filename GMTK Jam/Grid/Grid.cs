using Godot;
using System;

public class Grid : Node2D
{
    [Export]
    private int height = 3;

    [Export]
    private int width = 3;

    [Export]
    private int cellSize = 3;
    public override void _Ready()
    {
        for(int x = 0; x < width; x++)
        {
            for(int y = 0; y < height; y++)
            {
                GD.Print(x, y);
            }
        }
    }

    public void AddCell(int pos)
    {
        
    }
}
