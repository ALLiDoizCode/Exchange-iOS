//
//  MainViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material
import ScrollableGraphView
import UIColor_Hex_Swift

class MainViewController: SideViewController,ScrollableGraphViewDataSource {
    var ripplePriceLbl = UILabel()
    var rippleFeeLabel = UILabel()
    var buyBtn = FlatButton()
    var sellBtn = FlatButton()
    var walletView = WalletBalanceView()
    var transactionView = TransactionView()
    var charts:[(String,Int,Double)] = []
    var graphView:ScrollableGraphView = ScrollableGraphView()
    var currentTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.blue.accent2
        self.view.addSubview(ripplePriceLbl)
        self.view.addSubview(rippleFeeLabel)
        self.view.addSubview(buyBtn)
        self.view.addSubview(sellBtn)
        self.view.addSubview(walletView)
        self.view.addSubview(transactionView)
        self.view.addSubview(graphView)
        self.view.addSubview(currentTitle)
        setupViews()
        constrainViews()
        graphView.dataSource = self
        setupGraph()
        DispatchQueue.global(qos: .background).async {
            // Background Thread
            ExchangeClient.sharedInstance.rippleChart { (objects) in
                DispatchQueue.main.async {
                    // Run UI Updates
                    //let currentMonth = Date().monthName
                    //let previousMonth = Date().prevMonth.monthName
                    //var dates:[(String,Int,Double)] = []
                    for object in objects {
                        print("ploting points")
                        let contain = self.charts.contains(where: { date in
                            if date.0 == object.month && date.1 == object.day {
                                return true
                            }else {
                                return false
                            }
                        })
                        if contain == false {
                            var amount:Double = 0
                            for subObject in objects {
                                if subObject.month! == object.month! && subObject.day! == object.day!  {
                                    amount += subObject.rate!
                                }
                            }
                            let date = (object.month!,object.day!,amount)
                            self.charts.append(date)
                        }
                    }
                    
                    print("Will show \(self.charts.count) charts")
                    self.graphView.reload()
                }
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupViews() {
        
        buyBtn.setTitle("Buy", for: .normal)
        buyBtn.setTitleColor(Color.grey.lighten5, for: .normal)
        buyBtn.titleLabel?.font = RobotoFont.regular(with: 17)
        buyBtn.backgroundColor = Color.blue.accent3
        buyBtn.cornerRadius = 0
        
        sellBtn.setTitle("Sell", for: .normal)
        sellBtn.setTitleColor(Color.blue.accent3, for: .normal)
        sellBtn.titleLabel?.font = RobotoFont.regular(with: 17)
        sellBtn.backgroundColor = Color.grey.lighten5
        //sellBtn.borderWidth = 2
        //sellBtn.borderColor = Color.blue.accent3
        sellBtn.cornerRadius = 0
        
        currentTitle.text = "Dashboard"
        currentTitle.font = RobotoFont.bold(with: 24)
        currentTitle.textColor = Color.grey.lighten5
        currentTitle.textAlignment = .center
        
    }
    
    func constrainViews() {
        
        sellBtn.translatesAutoresizingMaskIntoConstraints = false
        buyBtn.translatesAutoresizingMaskIntoConstraints = false
        walletView.translatesAutoresizingMaskIntoConstraints = false
        graphView.translatesAutoresizingMaskIntoConstraints = false
        currentTitle.translatesAutoresizingMaskIntoConstraints = false
        
        sellBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        sellBtn.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        sellBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        sellBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        buyBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        buyBtn.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        buyBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        buyBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        walletView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.33).isActive = true
        walletView.bottomAnchor.constraint(equalTo: sellBtn.topAnchor, constant: 0).isActive = true
        walletView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        walletView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        graphView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.40).isActive = true
        graphView.bottomAnchor.constraint(equalTo: walletView.topAnchor, constant: 0).isActive = true
        graphView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        graphView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        currentTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        currentTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        currentTitle.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 0).isActive = true
        currentTitle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.35).isActive = true
    }
    
    func setupGraph() {
        
        // Setup the line plot.
        let linePlot = LinePlot(identifier: "darkLine")
        linePlot.lineWidth = 2
        linePlot.lineColor = UIColor("#777777")
        linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        linePlot.shouldFill = true
        linePlot.fillType = ScrollableGraphViewFillType.gradient
        linePlot.fillGradientType = ScrollableGraphViewGradientType.linear
        linePlot.fillGradientStartColor = UIColor("#555555")
        linePlot.fillGradientEndColor = UIColor("#444444")
        
        linePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        let dotPlot = DotPlot(identifier: "darkLineDot") // Add dots as well.
        dotPlot.dataPointSize = 2
        dotPlot.dataPointFillColor = Color.blue.accent3
        
        dotPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        // Setup the reference lines.
        let referenceLines = ReferenceLines()
        
        referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 17)
        referenceLines.referenceLineColor = Color.blue.accent3
        referenceLines.referenceLineLabelColor = Color.brown.lighten2
        
        referenceLines.positionType = .absolute
        // Reference lines will be shown at these values on the y-axis.
        referenceLines.absolutePositions = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        referenceLines.includeMinMax = false
        
        referenceLines.dataPointLabelColor = Color.blue.accent3
        
        // Setup the graph
        graphView.backgroundFillColor = UIColor("#333333")

        graphView.dataPointSpacing = 50
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.shouldRangeAlwaysStartAtZero = true
        
        graphView.rangeMax = 50
        
        // Add everything to the graph.
        graphView.addReferenceLines(referenceLines: referenceLines)
        graphView.addPlot(plot: linePlot)
        graphView.addPlot(plot: dotPlot)
    }
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        print("rate is \(charts[pointIndex].2)")
        return charts[pointIndex].2/1000000
    }
    
    func label(atIndex pointIndex: Int) -> String {
        let month = "\(charts[pointIndex].0)"
        let day = "\(charts[pointIndex].1)"
        let dash = "-"
        return "\(month)\(dash)\(day)"
    }
    
    func numberOfPoints() -> Int {
        
        return charts.count
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
